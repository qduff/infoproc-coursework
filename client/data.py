from collections import deque
from dataclasses import dataclass

stream = deque(maxlen=1000)

@dataclass
class CurrentState:
    rotation_amount: float
    shooting: bool
    accelerating: bool

state = CurrentState(rotation_amount=0, shooting=False, accelerating=False)

def parse_data():
    state.rotation_amount = stream[-1]
    state.shooting = False
    state.accelerating = False

