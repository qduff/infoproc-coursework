import capnp
import asyncio

HOST = "127.0.0.1"
PORT = 5000

schema_capnp = capnp.load('schema.capnp')

NUM_USERS = 5000


async def tcp_echo_client(i):

    commands = [f"login {i} {i}", f"create {i}", f"join {i}", "start"]
    reader, writer = await asyncio.open_connection('127.0.0.1', 5000)
    asyncio.sleep(0.05) # 50ms target, as in original
    while True:
        tx = schema_capnp.Tx.new_message()
        tx.angle = 0
        tx.propulsion = True
        tx.shoot = True
        tx.commands = commands
        commands.clear()
        writer.write(tx.to_bytes())

        data = await reader.read(4096)
        # with schema_capnp.Rx.from_bytes(data) as rx:
        #     # print(rx)
        #     ...



async def main():
    async with asyncio.TaskGroup() as tg:
        for i in range(NUM_USERS):
            tg.create_task(tcp_echo_client(i))


asyncio.run(main())
