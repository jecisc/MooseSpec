"
BaselineOfMooseSpec
"
Class {
	#name : #BaselineOfMooseSpec,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseSpec
}

{ #category : #baseline }
BaselineOfMooseSpec >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				famix: spec;
				spec: spec.
				
			"Packages"
			spec
				package: 'MooseSpec-Core' with: [ spec requires: #('Famix' 'Spec') ];
				package: 'MooseSpec-Core-Tests' with: [ spec requires: #('MooseSpec-Core' 'FamixTests') ].

			"Groups"
			spec
				group: 'Core' with: #('MooseSpec-Core');
				group: 'Tests' with: #('MooseSpec-Core-Tests') ]
]

{ #category : #dependencies }
BaselineOfMooseSpec >> famix: spec [
	spec
		baseline: 'Famix'
			with: [ spec
				loads: #('Core' 'Basic' 'ModelCompatibility' 'ModelJava' 'ModelSmalltalk' 'Importers');
				repository: 'github://jecisc/Famix:v1.x.x/src' ];
		project: 'FamixTests' copyFrom: 'Famix' with: [ spec loads: #('Tests') ]
]

{ #category : #dependencies }
BaselineOfMooseSpec >> spec: spec [
	spec baseline: 'Spec' with: [ spec repository: 'github://pharo-spec/Spec/src' ]
]
