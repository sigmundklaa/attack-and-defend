
import os
import shutil
import datetime
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

# tool for copying the source folder into a file that can be opened in the editor (for ease)

def move(out_path):
    par_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
    path = os.path.join(par_dir, 'src')

    if os.path.exists(out_path):
        shutil.rmtree(out_path)

    shutil.copytree(path, out_path)
    print('Copied at %s' % str(datetime.datetime.now()))

if __name__ == '__main__':

    _path  = os.getenv('AD_PATH')
    if _path:
        print(f'Found path \'{_path}\'')
    else:
        import sys
        _path = sys.argv[1]

    print('Copying...')

    move(_path)
