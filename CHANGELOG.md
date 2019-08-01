# Changelog
## Version 2
### 2.0.2
* Update Oj to 3.8

### 2.0.1
* Update Oj to 3.7

### 2.0.0
* Rewrite Errors stuff. There is now just a single `Cleverbot::Error` class. This improves portability with breaking API changes, and is just nicer in general.

## Version 1
### 1.2.3
* Fix unrecognized error throwing an error (#6) (saxton-tad)

### 1.2.2
* Bump HTTPClient version.
* Relicense as MIT.

### 1.2.1
* Use pessimistic version requirements, and bump Oj dependency.

### 1.2.0
* Improve performance by using optimized JSON instead of stdlib JSON
* Implement proper error handling for both of Cleverbot's errors, as well as a fallback error which complains about being unrecognized (#3).

### 1.1.0
* Merge `#create` into `#initialize`.
* `api_user` and `api_key` are no longer accessors, but readers.
* Fix old links and what-not.

### 1.0.0
* Initial release.
