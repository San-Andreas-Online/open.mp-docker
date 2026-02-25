# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Guiding Principles:

- Changelogs are for humans, not machines.
- There should be an entry for every single version.
- The same types of changes should be grouped.
- Versions and sections should be linkable.
- The latest version comes first.
- The release date of each version is displayed.
- Mention whether you follow Semantic Versioning.

Types of changes:

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities.

## Table of Contents

- [Changelog](#changelog)
  - [Table of Contents](#table-of-contents)
  - [\[4.0.3\] - 2026-02-25](#403---2026-02-25)
    - [Added in 4.0.3](#added-in-403)
  - [\[4.0.2\] - 2026-02-25](#402---2026-02-25)
    - [Added in 4.0.2](#added-in-402)
  - [\[4.0.1\] - 2026-02-25](#401---2026-02-25)
    - [Added in 4.0.1](#added-in-401)
  - [\[4.0.0\] - 2026-02-25](#400---2026-02-25)
    - [Added in 4.0.0](#added-in-400)
    - [Changed in 4.0.0](#changed-in-400)
  - [\[3.0.0\] - 2026-02-24](#300---2026-02-24)
    - [Removed in 3.0.0](#removed-in-300)
    - [Added in 3.0.0](#added-in-300)
  - [\[2.3.0\] - 2025-12-17](#230---2025-12-17)
    - [Added in 2.3.0](#added-in-230)
  - [\[2.2.0\] - 2025-01-22](#220---2025-01-22)
    - [Added in 2.2.0](#added-in-220)
  - [\[2.1.1\] - 2024-11-07](#211---2024-11-07)
    - [Added in 2.1.1](#added-in-211)
  - [\[2.0.0\] - 2024-11-07](#200---2024-11-07)
    - [Added in 2.0.0](#added-in-200)
  - [\[1.0.0\] - 2024-11-07](#100---2024-11-07)
    - [Added in 1.0.0](#added-in-100)

## [4.0.3] - 2026-02-25

### Added in 4.0.3

- Added security in launching announce to prevent the server passwords from being logged

## [4.0.2] - 2026-02-25

### Added in 4.0.2

- Added log to announce server launching and arguments used, for better visibility in the logs

## [4.0.1] - 2026-02-25

### Added in 4.0.1

- Added libatomic1 and libatomic1:i386 as dependency for the open.mp server

## [4.0.0] - 2026-02-25

### Added in 4.0.0

- Added image for open.mp v1.5.8.3079

### Changed in 4.0.0

- Duplicate files have been moved in a single folder called "common", and are now copied from the root of the project instead of from each image folder, to avoid duplication and make it easier to maintain.

## [3.0.0] - 2026-02-24

### Removed in 3.0.0

- Removed versioned images & open.mp server files, only the latest image is now available (server files are downloaded at build time)

### Added in 3.0.0

- Added support for x86 architecture on Linux (linux-386)

## [2.3.0] - 2025-12-17

### Added in 2.3.0

- Added image for open.mp v1.5.8.3079

## [2.2.0] - 2025-01-22

### Added in 2.2.0

- Added image for open.mp v1.4.0.2779

## [2.1.1] - 2024-11-07

### Added in 2.1.1

- Added support for environment variables to configure the server

## [2.0.0] - 2024-11-07

### Added in 2.0.0

- Base image with automatic downloading of the latest open.mp server version

## [1.0.0] - 2024-11-07

### Added in 1.0.0

- Base image with open.mp v1.3.1.2748 server version
