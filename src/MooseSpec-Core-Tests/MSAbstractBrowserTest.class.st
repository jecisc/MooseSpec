"
A MSAbsractBrowserTest is a test class for testing the behavior of MSAbsractBrowser
"
Class {
	#name : #MSAbstractBrowserTest,
	#superclass : #MSTestCase,
	#category : #'MooseSpec-Core-Tests'
}

{ #category : #testing }
MSAbstractBrowserTest class >> isAbstract [
	^ self = MSAbstractBrowserTest
]

{ #category : #helpers }
MSAbstractBrowserTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
MSAbstractBrowserTest >> testOpenWithoutError [
	| window |
	[ self shouldnt: [ window := self actualClass new openWithSpec ] raise: Exception ]
		ensure: [ window ifNotNil: #close ]
]
