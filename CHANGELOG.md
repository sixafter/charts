# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Date format: `YYYY-MM-DD`

---
## [Unreleased]

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

---
## [1.3.2] - 2025-10-29

### Added
### Changed
- `risk`: Remove the Azure Helm setup action as per GitHub [comment](https://github.com/helm/helm/issues/31434#issuecomment-3463348932) and use the version of Helm on the [GitHub runner](https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2404-Readme.md?plain=1#L31).

### Deprecated
### Removed
### Fixed
### Security

---
## [1.3.1] - 2025-10-29

### Added
### Changed
- `risk`: Workaround to bypass Azure Front Door (CDN) being down.

### Deprecated
### Removed
### Fixed
### Security

---
## [1.3.0] - 2025-10-29

### Added
### Changed
- `debt`: Upgraded all dependencies to their latest stable versions.

### Deprecated
### Removed
### Fixed
### Security

---
## [1.2.0] - 2025-03-05

### Added
### Changed
- `debt`: Upgraded all dependencies to their latest stable versions.

### Deprecated
### Removed
### Fixed
### Security

---
## [1.1.0] - 2025-01-26

### Added
- `feature`: Added support for the [cert-issuer](charts/cert-issuer/) Helm chart.

### Changed
### Deprecated
### Removed
### Fixed
### Security

---
## [1.0.0] - 2025-01-25

### Added
- `feature`: Initial commit.

### Changed
### Deprecated
### Removed
### Fixed
### Security

[Unreleased]: https://github.com/scriptures-social/platform/compare/1.3.2...HEAD
[1.3.2]: https://github.com/scriptures-social/platform/compare/1.3.1...1.3.2
[1.3.1]: https://github.com/scriptures-social/platform/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/scriptures-social/platform/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/scriptures-social/platform/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/scriptures-social/platform/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/scriptures-social/platform/compare/8090a69f7c51a7703b9b49b7633749c8b3b1f391...1.0.0

[MUST]: https://datatracker.ietf.org/doc/html/rfc2119
[MUST NOT]: https://datatracker.ietf.org/doc/html/rfc2119
[SHOULD]: https://datatracker.ietf.org/doc/html/rfc2119
[SHOULD NOT]: https://datatracker.ietf.org/doc/html/rfc2119
[MAY]: https://datatracker.ietf.org/doc/html/rfc2119
[SHALL]: https://datatracker.ietf.org/doc/html/rfc2119
[SHALL NOT]: https://datatracker.ietf.org/doc/html/rfc2119
[REQUIRED]: https://datatracker.ietf.org/doc/html/rfc2119
[RECOMMENDED]: https://datatracker.ietf.org/doc/html/rfc2119
[NOT RECOMMENDED]: https://datatracker.ietf.org/doc/html/rfc2119
