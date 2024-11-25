#!/bin/bash
OUTPUT_PATH="prof_results"
mkdir -p ${OUTPUT_PATH}

RUN_CMD="python test.py"
NSYS_PROF="nsys profile
            --output=${OUTPUT_PATH}/test
            --force-overwrite=true
            --capture-range=cudaProfilerApi
            --capture-range-end=stop "
NSYS_STATS="nsys stats
            --force-overwrite=true
            --force-export=true
            --output=.
            --format=csv
            --timeunit=msec
            --report=nvtxgpuproj
            --report=nvtxpptrace "

echo ${RUN_CMD}
# ${RUN_CMD}
${NSYS_PROF} ${RUN_CMD}