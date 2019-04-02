Class {
	#name : #MSAllAssociationsNavigationQueryStrategy,
	#superclass : #MSAbstractAssociationNavigationQueryStrategy,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSAllAssociationsNavigationQueryStrategy >> displayIncomingOn: aStream [
	aStream << 'entity queryAllIncoming opposites'
]

{ #category : #printing }
MSAllAssociationsNavigationQueryStrategy >> displayOutgoingOn: aStream [
	aStream << 'entity queryAllOutgoing opposites'
]

{ #category : #action }
MSAllAssociationsNavigationQueryStrategy >> queryIncomingWith: anEntity [
	^ anEntity queryAllIncoming opposites
]

{ #category : #action }
MSAllAssociationsNavigationQueryStrategy >> queryOutgoingWith: anEntity [
	^ anEntity queryAllOutgoing opposites
]
