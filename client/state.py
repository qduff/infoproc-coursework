from dataclasses import dataclass

@dataclass
class State:
    rotation_amount: float
    shooting: bool
    accelerating: bool

state = State(rotation_amount=0, shooting=False, accelerating=False)

