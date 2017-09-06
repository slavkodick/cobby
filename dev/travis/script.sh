#!/usr/bin/env bash

echo '==> Doing phpcs tests with EcgM2 Standard setting.'
../magento-ce/vendor/bin/phpcs --standard=../magento-ce/vendor/magento-ecg/coding-standard/EcgM2/ ../magento-ce/vendor/slavkodick/cobby/;  #--standard=;

cd ../magento-ce
echo '==> Doing unit tests.';
php bin/magento dev:tests:run unit

echo '==> Doing integration tests.'
php bin/magento dev:tests:run integration