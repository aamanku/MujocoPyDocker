import mujoco_py
import os
mj_path = mujoco_py.utils.discover_mujoco()
xml_path = os.path.join(mj_path, 'model', 'humanoid.xml')
model = mujoco_py.load_model_from_path(xml_path)
sim = mujoco_py.MjSim(model)

print(sim.data.qpos)
sim.step()
print(sim.data.qpos)

vi = mujoco_py.MjViewer(sim)
vi.render()
while True:
    sim.step()
    vi.render()
