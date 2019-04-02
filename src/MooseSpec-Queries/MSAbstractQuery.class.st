Class {
	#name : #MSAbstractQuery,
	#superclass : #Object,
	#instVars : [
		'pattern'
	],
	#category : #'MooseSpec-Queries-Core'
}

{ #category : #testing }
MSAbstractQuery class >> isAbstract [
	^ self = MSAbstractQuery
]

{ #category : #running }
MSAbstractQuery >> displayOn: aStream [ 
	self subclassResponsibility
]

{ #category : #running }
MSAbstractQuery >> runOn: aMooseGroup [
	"I should run myself on the MooseGroup as parameter and return a new MooseGroup with my result."

	^ self subclassResponsibility
]
