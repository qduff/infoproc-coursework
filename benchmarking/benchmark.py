import capnp
import asyncio

HOST = "127.0.0.1"
PORT = 5000

schema_capnp = capnp.load('schema.capnp')

NUM_USERS = 16384
LOBBY_SIZE = 8

async def send(writer, commands):
    tx = schema_capnp.Tx.new_message()
    tx.angle = 0
    tx.propulsion = True
    tx.shoot = False
    if commands is not None:
        tx.commands = commands
    writer.write(tx.to_bytes())

async def read(reader):
    _ = await reader.read(4096)


class BenchClass:
    def __init__(self, i) -> None:
        self.i = i

    async def conn(self):
        self.reader, self.writer = await asyncio.open_connection('127.0.0.1', 5000)

    async def auth(self):
        await send(self.writer, [f"register {self.i} {self.i}", f"login {self.i} {self.i}"]) # on clean db will register anew
        await read(self.reader)

    async def create_lobbies(self):
        if self.i%LOBBY_SIZE==0:
            await send(self.writer, [f"create lobby{self.i//8}"])
            await read(self.reader)

    async def join_lobbies(self):
        if self.i%LOBBY_SIZE!=0  :
            await send(self.writer, [f"join lobby{self.i//8}"])
            await read(self.reader)

    async def start(self):
        if self.i%LOBBY_SIZE==0:
            await send(self.writer, ["start"])
            await read(self.reader)

    async def loop(self):
        while True:
            await send(self.writer, None)
            await read(self.reader)



async def main():
    tasks = []
    for i in range(NUM_USERS):
        tasks.append(BenchClass(i))

    print("connecting")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.conn())

    print("authenticating")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.auth())

    print("creating lobbies")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.create_lobbies())

    print("joining lobbies")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.join_lobbies())

    print("starting lobbies")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.start())

    print("main loop")
    async with asyncio.TaskGroup() as tg:
        for task in tasks:
            tg.create_task(task.loop())


asyncio.run(main())
