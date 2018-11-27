Class {
	#name : #MSReleaseTest,
	#superclass : #MSTestCase,
	#category : #'MooseSpec-Core-Tests'
}

{ #category : #tests }
MSReleaseTest >> testNoUnusedTemporaryVariablesLeft [
	"Fail if there are methods who have unused temporary variables"

	[ | found |
	found := ((RPackageOrganizer default packages select: [ :each | each name beginsWith: 'MooseSpec' ]) flatCollect: [ :each | each classes flatCollect: #localMethods ])
		select: [ :m | m ast temporaries anySatisfy: [ :x | x binding isUnused ] ].
	self assert: found isEmpty description: 'the following methods have unused temporary variables and should be cleaned: ' , found asString ]
		ensure: [ ASTCache reset ]
]
