# MooseSpec

## Description

A set of Spec tools for Moose.

## Installation

To install MooseSpec on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'jecisc' project: 'MooseSpec' commitish: 'v1.x.x' path: 'src';
    	baseline: 'MooseSpec';
    	load
```

To add MooseSpec to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'MooseSpec'
    	with: [ spec repository: 'github://jecisc/MooseSpec:v1.x.x/src' ]
```

Note that you can replace the #v1.x.x by a branch as #master or #development or a tag as #v1.0.0, #v1.? or #v1.2.x.
