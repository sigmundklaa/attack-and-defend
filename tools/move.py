
import os
import shutil
import datetime

# tool for copying the source folder into a file that can be opened in the editor (for ease)

def move(out_path):
    par_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
    path = os.path.join(par_dir, 'src')

    if os.path.exists(out_path):
        shutil.rmtree(out_path)

    shutil.copytree(path, out_path)
    print('Copied at %s' % str(datetime.datetime.now()))

if __name__ == '__main__':
    import sys

    move(sys.argv[1])
