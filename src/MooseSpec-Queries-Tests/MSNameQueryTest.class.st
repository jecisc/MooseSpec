Class {
	#name : #MSNameQueryTest,
	#superclass : #MSAbstractQueryTest,
	#category : #'MooseSpec-Queries-Tests'
}

{ #category : #helpers }
MSNameQueryTest >> actualClass [
	^ MSNameQuery
]

{ #category : #tests }
MSNameQueryTest >> testDisplayOn [
	query := MSNameQuery fromString: 'LANP'. 
	
	self assert: (String streamContents: [ :s | query displayOn: s]) equals: 'mooseGroup select: [ :each | each includesSubstring: LANP ]'
]

{ #category : #tests }
MSNameQueryTest >> testRunOn [
	| classes |
	classes := model allModelClasses select: #isInstanceSide.
	query := MSNameQuery fromString: 'LANP'.

	self assert: (query runOn: classes) size equals: 3.
	self flag: #mooseTodo. "We should not have to cast the array as a Moose group. See issue: https://github.com/moosetechnology/Moose/issues/1485. Remove this workaround when the issues will be fixed."
	self assertCollection: ((query runOn: classes) collect: #name) hasSameElements: #('LANPool' 'LANPacket' 'LANPrintServer') asMooseGroup
]
