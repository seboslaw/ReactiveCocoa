{
  "name": "ReactiveCocoa",
  "version": "2.4.4",
  "summary": "A framework for composing and transforming streams of values.",
  "homepage": "https://github.com/blog/1107-reactivecocoa-is-now-open-source",
  "authors": {
    "Josh Abernathy": "josh@github.com"
  },
  "source": {
    "git": "https://github.com/ReactiveCocoa/ReactiveCocoa.git",
    "tag": "v2.4.4"
  },
  "license": {
    "type": "MIT",
    "file": "LICENSE.md"
  },
  "description": "ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values.",
  "requires_arc": true,
  "platforms": {
    "ios": "6.0",
    "osx": "10.8"
  },
  "prepare_command": "    find . \\( -regex '.*EXT.*\\.[mh]$' -o -regex '.*metamacros\\.[mh]$' \\) -execdir mv {} RAC{} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@\"(EXT.*|metamacros)\\.h\"@\"RAC\\1.h\"@' {} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@<ReactiveCocoa/(EXT.*)\\.h>@<ReactiveCocoa/RAC\\1.h>@' {} \\;\n",
  "default_subspecs": "UI",
  "subspecs": [
    {
      "name": "no-arc",
      "source_files": "ReactiveCocoa/RACObjCRuntime.{h,m}",
      "requires_arc": false
    },
    {
      "name": "Core",
      "dependencies": {
        "ReactiveCocoa/no-arc": [

        ]
      },
      "source_files": [
        "ReactiveCocoa/*.{d,h,m}",
        "ReactiveCocoa/extobjc/*.{h,m}"
      ],
      "private_header_files": [
        "ReactiveCocoa/*Private.h"
      ],
      "exclude_files": "ReactiveCocoa/*{RACObjCRuntime,AppKit,NSControl,NSText,UIActionSheet,UI}*"
    },
    {
      "name": "UI",
      "dependencies": {
        "ReactiveCocoa/Core": [

        ]
      },
      "source_files": "ReactiveCocoa/*{AppKit,NSControl,NSText,UI}*",
      "osx": {
        "exclude_files": "ReactiveCocoa/UI*"
      },
      "ios": {
        "exclude_files": "ReactiveCocoa/*{AppKit,NSControl,NSText}*"
      }
    }
  ]
}