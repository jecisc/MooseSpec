"
Description
--------------------

I am an abstract test case for MooseSpec project.
"
Class {
	#name : #MSTestCase,
	#superclass : #TestCase,
	#category : #'MooseSpec-Core-Tests'
}

{ #category : #testing }
MSTestCase class >> isAbstract [
	^ self = MSTestCase
]

{ #category : #testing }
MSTestCase class >> shouldInheritSelectors [
	^ true
]
