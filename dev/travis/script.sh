#!/usr/bin/env bash

echo '==> Doing phpcs tests with MEQP2 Standard setting.'
../magento-ce/vendor/bin/phpcs ./vendor/slavkodick/cobby/  --standard=MEQP2;

#cd ../magento-ce
#echo '==> Doing unit tests.';
#php bin/magento dev:tests:run unit
#
#echo '==> Doing integration tests.'
#php bin/magento dev:tests:run integration