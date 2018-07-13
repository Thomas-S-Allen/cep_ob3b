
import sys as sys
sys.path.append("/Users/thomasallen/Code/python_scripts/Functions")

from hecto_funcs import hectospec_fits_open_index
from hecto_funcs import hectospec_fits_open_index
from astropy.io import ascii

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dir_in='/Users/thomasallen/cep_ob3b/data/Spectroscopy/'
standards_fn=dir_in+'spec_standards.dat'
#print(standards_fn)
stand=ascii.read(standards_fn)
spt=stand['col1']
index=stand['col2']
num=stand['col3']

off = np.arange(len(fn))

print(off)

df = pd.read_csv(standards_fn)

wav,flx = hectospec_fits_open_index(index)

import pdb; pdb.set_trace()
