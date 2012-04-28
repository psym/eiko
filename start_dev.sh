#!/bin/sh
######################################################################
#
# This script allows running eiko from the deps folder.
# It's intended to be used for development so the full system
# can be run without needing to generate a release.
#
# Warning: The configuration file from the release is used. 
#           Any changes made when running from here will be
#           reflected in release generation.
#
######################################################################

cd `dirname $0`
CONFIG="\"rel/overlay/etc/eiko.config\""
exec erl -sname eiko \
    -pa $PWD/ebin $PWD/deps/*/ebin \
    -boot start_sasl \
    -eiko_core config ${CONFIG} \
    -s reloader \
    -s lager \
    -s eiko_core
