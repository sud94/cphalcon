#!/bin/sh

ZEND_DONT_UNLOAD_MODULES=1 vendor/bin/phpunit --bootstrap unit-tests/ci/phpunit.php unit-tests/
result_phpunit=$?

$(phpenv which php) codecept.phar build
ZEND_DONT_UNLOAD_MODULES=1 $(phpenv which php) codecept.phar run
result_codecept=$?

if [ $result_phpunit -ne 0 -o $result_codecept -ne 0 ];
then
   exit 1;
fi
