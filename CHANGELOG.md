# Changelog

## [1.3.1](https://github.com/antmelekhin/terraform-yandex-compute/compare/v1.3.0...v1.3.1) (2024-04-09)


### Fixes

* add `name` output and fix old output values for `instance` module ([#9](https://github.com/antmelekhin/terraform-yandex-compute/issues/9)) ([f471e89](https://github.com/antmelekhin/terraform-yandex-compute/commit/f471e895191a9960db3377640128965053079ec3))

## [1.3.0](https://github.com/antmelekhin/terraform-yandex-compute/compare/v1.2.0...v1.3.0) (2024-04-08)


### Features

* add `snapshot` module ([#8](https://github.com/antmelekhin/terraform-yandex-compute/issues/8)) ([32f2f0d](https://github.com/antmelekhin/terraform-yandex-compute/commit/32f2f0de9d8dc210112e8e26b5772a718b2c0ecc))

## [1.2.0](https://github.com/antmelekhin/terraform-yandex-compute/compare/v1.1.0...v1.2.0) (2024-04-06)


### Features

* add `maintenance_policy` and `maintenance_grace_period` variables ([#7](https://github.com/antmelekhin/terraform-yandex-compute/issues/7)) ([0de2836](https://github.com/antmelekhin/terraform-yandex-compute/commit/0de2836b2183995f9aa38a3f50adc2dd3c66ef69))

## [1.1.0](https://github.com/antmelekhin/terraform-yandex-compute/compare/v1.0.0...v1.1.0) (2024-04-06)


### Features

* add `metadata_options` argument ([#6](https://github.com/antmelekhin/terraform-yandex-compute/issues/6)) ([035def0](https://github.com/antmelekhin/terraform-yandex-compute/commit/035def01c974277a8bf9fbc26c81690e564ca834))

## [1.0.0](https://github.com/antmelekhin/terraform-yandex-compute/compare/v0.5.0...v1.0.0) (2024-04-03)


### ⚠ BREAKING CHANGES

* update provider version (#5)

### Continuous Integration

* update release rules ([07a905d](https://github.com/antmelekhin/terraform-yandex-compute/commit/07a905d17d6c56a3cd8ad942f6b022ccacdcbc63))


### Features

* update provider version ([#5](https://github.com/antmelekhin/terraform-yandex-compute/issues/5)) ([cab0e4b](https://github.com/antmelekhin/terraform-yandex-compute/commit/cab0e4b74acbd62653b36af8701a0fa3d3b1a6f0))

## [0.5.0](https://github.com/antmelekhin/terraform-yandex-compute/compare/v0.4.0...v0.5.0) (2023-09-11)


### Continuous Integration

* add release workflow ([879eb4c](https://github.com/antmelekhin/terraform-yandex-compute/commit/879eb4c20a96fd7588b69097571f398e149bd1cc))


### Features

* add `secondary_disk` block in instance-group module ([#4](https://github.com/antmelekhin/terraform-yandex-compute/issues/4)) ([0f42ae1](https://github.com/antmelekhin/terraform-yandex-compute/commit/0f42ae160ee196dfd4218ae1d8ad08fafb652394))


### Tests

* add pre commit hooks ([#3](https://github.com/antmelekhin/terraform-yandex-compute/issues/3)) ([fd3654d](https://github.com/antmelekhin/terraform-yandex-compute/commit/fd3654d487298cbd1225a1bb03738facdee23429))

## v0.4.0

- Add all supported arguments to the `boot_disk` block in modules.
- Add dynamic blocks for dns_records.
- Add `network_acceleration_type` and `allow_stopping_for_update` variables.

## v0.2.0

- Fix tflint warnings
- Add Github workflow
- Update READMEs

## v0.1.0

- Add code, examples and READMEs
- Initial commit
