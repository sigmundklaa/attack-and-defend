
import os
import shutil
import datetime
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

# tool for copying the source folder into a file that can be opened in the editor (for ease)

par_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
src = os.path.join(par_dir, 'src')

def copy_mission(out_path):
    if os.path.exists(out_path):
        shutil.rmtree(out_path)

    shutil.copytree(src, out_path)
    print('Copied at %s' % str(datetime.datetime.now()))

def copy_sqm(path):
    shutil.copyfile(
        path,
        os.path.join(src, 'mission.sqm')
    )

if __name__ == '__main__':
    import sys

    mode = {
        'sqm': copy_sqm,
        'mission': copy_mission
    }[sys.argv[1]]

    _path  = os.getenv('AD_PATH')
    if _path:
        print(f'Found path \'{_path}\'')
    else:
        _path = sys.argv[2]

    print('Copying...')

    mode(_path)
