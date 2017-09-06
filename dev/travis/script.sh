#!/usr/bin/env bash

set -e
trap '>&2 echo Error: Command \`$BASH_COMMAND\` on line $LINENO failed with exit code $?' ERR

echo '==> Doing phpcs tests with EcgM2 Standard setting.'
../magento-ce/vendor/bin/phpcs --standard=../magento-ce/vendor/magento-ecg/coding-standard/EcgM2/ ../magento-ce/vendor/slavkodick/cobby/;  #--standard=;

#cd ../magento-ce
#echo '==> Doing unit tests.';
#php bin/magento dev:tests:run unit
#
#echo '==> Doing integration tests.'
#php bin/magento dev:tests:run integration