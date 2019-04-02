Class {
	#name : #MSNavigationQuery,
	#superclass : #MSAbstractQuery,
	#instVars : [
		'association',
		'direction'
	],
	#category : #'MooseSpec-Queries-Terminal'
}

{ #category : #'instance creation' }
MSNavigationQuery class >> association: aFAMIXAssociation direction: aDirectionStrategy [
	^ self new
		association: aFAMIXAssociation;
		direction: aDirectionStrategy;
		yourself
]

{ #category : #accessing }
MSNavigationQuery >> association [
	^ association
]

{ #category : #accessing }
MSNavigationQuery >> association: anObject [
	association := anObject
]

{ #category : #accessing }
MSNavigationQuery >> direction [
	^ direction
]

{ #category : #accessing }
MSNavigationQuery >> direction: anObject [
	direction := anObject
]

{ #category : #running }
MSNavigationQuery >> displayOn: aStream [
	aStream
		<<
			'(aMooseGroup
		inject: Set new
		into: [ :result :entity | 
			result addAll: '.
	self direction displayOn: aStream with: self association.
	aStream
		<<
			'.
			result ]) asMooseGroup'
]

{ #category : #running }
MSNavigationQuery >> runOn: aMooseGroup [
	"I should run myself on the MooseGroup as parameter and return a new MooseGroup with my result."

	^ (aMooseGroup
		inject: Set new
		into: [ :result :entity | 
			result addAll: (self direction query: entity with: self association).
			result ]) asMooseGroup
]
