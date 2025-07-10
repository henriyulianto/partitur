#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

HY='invoke --search-root=/home/henri/github.com/henriyulianto/bwv-zeug/invoke'

echo -e "${BLUE}🎵 REBUILDING ALL SONGS.${NC}\n\n"
cd ../lagu
for lagu in $(ls -d */); do
  echo -e "=================================\n"
  echo -e "${GREEN}🎵 Rebuilding ${lagu%%/}...${NC}\n\n"
  cd ${lagu}
  ${HY} clean all
  echo -e "\n${GREEN}🎵 Done rebuilding ${lagu%%/}.${NC}\n"
  echo -e "=================================\n\n"
  cd ..
done

echo -e "${BLUE}🎵 DONE rebuilding all songs.\n"
exit 0
