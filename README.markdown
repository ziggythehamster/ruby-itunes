ruby-itunes
===========

License: >= GPL-2

This project aims to provide a Ruby API for iTunes. Currently it uses the iTunes COM SDK, but since we aren't
using `method_missing` trickery, and instead are defining every method of the SDK, it should be fairly simple
to make it also support the AppleScript interface.

Ideas
-----

* Provide a RESTful API for a local iTunes instance, so for example,
  you can run iTunes in a virtual machine and access that instance
  from the host (i.e. Linux).
