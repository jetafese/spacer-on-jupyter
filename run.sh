#!/bin/bash

z3 $1 -v:1 fp.xform.slice=false \
	fp.xform.inline_linear=false \
	fp.xform.inline_eager=false \
	fp.spacer.trace_file=$1.log \
	fp.spacer.max_level=40

