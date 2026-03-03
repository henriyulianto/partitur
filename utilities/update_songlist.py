import json
import os
from datetime import datetime

# Get the directory where this script is located
script_dir = os.path.dirname(os.path.abspath(__file__))
# Get the parent directory (project root)
project_root = os.path.dirname(script_dir)

json_file_path = os.path.join(project_root, 'songlist.json')
songlist = []
songlist_json = {}
path = os.path.join(project_root, 'lagu')

try:
    for item in os.listdir(path):
        full_path = os.path.join(path, item)
        exports_path = os.path.join(full_path, "exports")          
        if os.path.isdir(exports_path):
            yaml_file_path = os.path.join(exports_path, f'{item}.config.yaml')
            if os.path.isfile(yaml_file_path):
                songlist.append(item)
    if len(songlist) > 0:
        songlist_json["lagu"] = songlist
        songlist_json["jumlah"] = len(songlist)
        songlist_json["update_terakhir"] = f'{datetime.now()}'
        with open(json_file_path, 'w') as json_file:
            json.dump(songlist_json, json_file, indent=2)
    else:
        print('Tidak menemukan satu pun direktori lagu.')
                
except Exception as e:
    print(f"An unexpected error occurred: {e}")
    
finally: 
    print(f'File {json_file_path} berhasil dibuat.')
    with open(json_file_path, 'r') as json_file:
        loaded_data = json.load(json_file)
        loaded_data_str = json.dumps(loaded_data, indent=2)
        print(loaded_data_str)
