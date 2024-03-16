import random
import capnp
import asyncio

HOST = "127.0.0.1"
PORT = 5000

schema_capnp = capnp.load('schema.capnp')

NUM_USERS = 100


async def tcp_echo_client(i):

    commands = [f"login {i} {i}", "join lobby"]
    reader, writer = await asyncio.open_connection('127.0.0.1', 5000)
    while True:
        tx = schema_capnp.Tx.new_message()
        tx.angle = random.uniform(-1, 1)
        tx.propulsion = True
        tx.shoot = False
        tx.commands = commands
        commands.clear()
        writer.write(tx.to_bytes())

        _ = await reader.read(4096)
        # with schema_capnp.Rx.from_bytes(data) as rx:
        #     # print(rx)
        #     ...
        await asyncio.sleep(0.05) # 50ms target, as in original



async def main():
    async with asyncio.TaskGroup() as tg:
        for i in range(NUM_USERS):
            tg.create_task(tcp_echo_client(i))


asyncio.run(main())
