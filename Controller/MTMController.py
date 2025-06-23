import subprocess

#_______________________________________________________________________________
def trig_on():
    cmd = 'ssh sks@vme02 mtm-ctrl/bin/trig_on'
    subprocess.call(cmd.split())

#_______________________________________________________________________________
def trig_off():
    cmd = 'ssh sks@vme02 mtm-ctrl/bin/trig_off'
    subprocess.call(cmd.split())

#_______________________________________________________________________________
def mtm_reset():
    cmd = 'ssh sks@vme02 mtm-ctrl/bin/mtm_reset'
    subprocess.call(cmd.split())

#_______________________________________________________________________________
def get_trig_state():
  cmd = 'ssh sks@vme02 cat /tmp/trig.txt'
  ret = subprocess.check_output(cmd.split())
  status = int(ret.decode())
  if status == 0: 
    return 'ON'
  else          :
    return 'OFF'

#_______________________________________________________________________________
def force_L2():
    cmd = 'ssh sks@vme02 mtm-ctrl/bin/force_l2'
    subprocess.call(cmd.split())

#_______________________________________________________________________________
if __name__ == '__main__':
  ret = get_trig_state()
  print(ret)
