Class {
	#name : #MSNavigationQueryTest,
	#superclass : #MSAbstractQueryTest,
	#category : #'MooseSpec-Queries-Tests'
}

{ #category : #helpers }
MSNavigationQueryTest >> actualClass [
	^ MSNavigationQuery
]

{ #category : #tests }
MSNavigationQueryTest >> testDisplayIncomingInvocation [
	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy with: FamixStInvocation) direction: MSIncomingNavigationQueryStrategy.

	self assert: (String streamContents: [ :aStream | query displayOn: aStream ]) equals: '(aMooseGroup
		inject: Set new
		into: [ :result :entity | 
			result addAll: (entity queryIncoming: FamixStInvocation) opposites.
			result ]) asMooseGroup'
]

{ #category : #tests }
MSNavigationQueryTest >> testDisplayIncomingInvocation2 [
	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy withAll: {FamixStInvocation . FamixStInheritance}) direction: MSIncomingNavigationQueryStrategy.

	self
		assert: (String streamContents: [ :aStream | query displayOn: aStream ])
		equals:
			'(aMooseGroup
		inject: Set new
		into: [ :result :entity | 
			result addAll: ({ FamixStInvocation . FamixStInheritance } flatCollect: [ :association | (entity queryIncoming: association) opposites ]).
			result ]) asMooseGroup'
]

{ #category : #tests }
MSNavigationQueryTest >> testDisplayOn [
	query := MSNavigationQuery association: MSAllAssociationsNavigationQueryStrategy new direction: MSOutgoingNavigationQueryStrategy.

	self
		assert: (String streamContents: [ :s | query displayOn: s ])
		equals:
			'(aMooseGroup
		inject: Set new
		into: [ :result :entity | 
			result addAll: entity queryAllOutgoing opposites.
			result ]) asMooseGroup'
]

{ #category : #tests }
MSNavigationQueryTest >> testIncomingInvocation [
	| grp |
	grp := MooseAbstractGroup new.
	grp add: (model entityNamed: 'Smalltalk::LANPacket.contents()').

	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy with: FamixStInvocation) direction: MSIncomingNavigationQueryStrategy.

	self assert: (query runOn: grp) size equals: 3
]

{ #category : #tests }
MSNavigationQueryTest >> testIncomingInvocation2 [
	| grp |
	grp := MooseAbstractGroup new.
	grp add: (model entityNamed: 'Smalltalk::LANPacket.contents()').

	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy withAll: {FamixStInvocation . FamixStInheritance}) direction: MSIncomingNavigationQueryStrategy.

	self assert: (query runOn: grp) size equals: 3
]

{ #category : #tests }
MSNavigationQueryTest >> testLocalIncomingInvocation [
	| grp |
	grp := MooseAbstractGroup new.
	grp add: (model entityNamed: 'Smalltalk::LANPacket.contents()').

	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy with: FamixStInvocation) direction: MSLocalIncomingNavigationQueryStrategy.

	self assert: (query runOn: grp) size equals: 3
]

{ #category : #tests }
MSNavigationQueryTest >> testOutgoingInheritance [
	| grp |
	grp := MooseAbstractGroup new.
	grp add: (model entityNamed: 'Smalltalk::LANFileServer').

	query := MSNavigationQuery association: (MSAssociationNavigationQueryStrategy with: FamixStInheritance) direction: MSOutgoingNavigationQueryStrategy.

	self assert: (query runOn: grp) anyOne equals: (model entityNamed: 'Smalltalk::LANOutputServer')
]

{ #category : #tests }
MSNavigationQueryTest >> testRunOn [
	| grp |
	grp := MooseAbstractGroup new.
	grp add: (model entityNamed: 'Smalltalk::LANNode.initialize()').

	query := MSNavigationQuery association: (MSAllAssociationsNavigationQueryStrategy new) direction: MSOutgoingNavigationQueryStrategy.

	self assert: (query runOn: grp) size equals: 2
]
