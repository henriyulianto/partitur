import json
import os
import yaml
from datetime import datetime

json_file_path = '../songlist.json'
songlist = []
songlist_json = {}
path = '../lagu'
count = 0

try:
    for item in os.listdir(path):
        full_path = os.path.join(path, item)
        exports_path = os.path.join(full_path, "exports")          
        if os.path.isdir(exports_path):
            yaml_file_path = os.path.join(exports_path, f'{item}.config.yaml')
            if os.path.isfile(yaml_file_path):
                count += 1
                # Read YAML
                with open(yaml_file_path, 'r') as file:
                    data = yaml.safe_load(file)
                file.close()
                frontmatter  = f'---\n'
                frontmatter += f'layout: hyplayer\n'
                frontmatter += f'titleOnly: {data['workInfo']['title']}\n'
                frontmatter += f'title: "{data['workInfo']['title']} ({data['workInfo']['instrument']})"\n'
                frontmatter += f'instrument: "{data['workInfo']['instrument']}"\n'
                frontmatter += f'workId: {item}\n'
                frontmatter += f'parent: Beranda\n'
                frontmatter += f'permalink: /{item}/\n'
                frontmatter_temp = ''
                if 'composer' in data['workInfo']:
                    frontmatter += f'composer: "{data['workInfo']['composer']}"\n'
                if 'arranger' in data['workInfo']:
                    if data['workInfo']['arranger'] == data['workInfo']['composer']:
                        frontmatter += f'composer_and_arranger: "{data['workInfo']['arranger']}"\n'
                    else:
                        frontmatter += f'arranger: "{data['workInfo']['arranger']}"\n'
                if 'lyricist' in data['workInfo']:
                    if data['workInfo']['lyricist'] == data['workInfo']['composer'] == data['workInfo']['arranger']:
                        frontmatter += f'composer_and_arranger_and_lyricist: "{data['workInfo']['lyricist']}"\n'
                    elif data['workInfo']['lyricist'] == data['workInfo']['composer']:
                        frontmatter += f'composer_and_lyricist: "{data['workInfo']['lyricist']}"\n'
                    elif data['workInfo']['lyricist'] == data['workInfo']['arranger']:
                        frontmatter += f'arranger_and_lyricist: "{data['workInfo']['lyricist']}"\n'
                    else:
                        frontmatter += f'lyricist: "{data['workInfo']['lyricist']}"\n'
                if 'additionalInfo' in data['workInfo']:
                    frontmatter += f'additionalInfo: "{data['workInfo']['additionalInfo']}"\n'
                if 'notationType' in data['workInfo']:
                    frontmatter += f'notationType: "{data['workInfo']['notationType']}"\n'
                if 'youtubeURL' in data['workInfo']:
                    frontmatter += f'youtubeURL: "{data['workInfo']['youtubeURL']}"\n'
                frontmatter += f'work_type: {data['workInfo']['workType']}\n'
                pdfPath = f'lagu/{item}/exports/{item}.pdf'
                if 'pdfPath' in data['files']:
                    pdfPath = f'lagu/{item}/exports/{data['files']['pdfPath']}.pdf'
                if os.path.isfile(f'../{pdfPath}'):
                    frontmatter += f'pdf_path: "{pdfPath}"\n'
                frontmatter += f'---\n\n'
                page_file_path = os.path.join(full_path, 'index.md')
                with open(page_file_path, 'w') as file:
                    res = file.write(frontmatter)
                if res > 0:
                    print(f'{page_file_path} telah sukses dibuat.')
                    
    if count == 0:
        print('Tidak menemukan satu pun direktori lagu.')
                
except Exception as e:
    print(f"An unexpected error occurred: {e}")
except yaml.YAMLError as exc:
    print(f"Error parsing YAML file: {exc}")
