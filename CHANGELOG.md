# Changelog
## Version 1
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
