# Changelog

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
