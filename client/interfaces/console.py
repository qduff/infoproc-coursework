from state import commands, commands_lock
from threading import Thread

def consoleReader():
    # no gui, just console
    while True:
        cmd = input(">")
        with commands_lock:
            commands.append(cmd)

console_thread = Thread(target=consoleReader)
console_thread.daemon = True
