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
		do: [ "Dependencies"
			self
				famix: spec;
				spec: spec.

			"Packages"
			spec
				package: 'MooseSpec-Core' with: [ spec requires: #('Famix' 'Spec') ];
				package: 'MooseSpec-Queries' with: [ spec requires: #('MooseSpec-Core') ];
				package: 'MooseSpec-Core-Tests' with: [ spec requires: #('MooseSpec-Core' 'FamixTests') ];
				package: 'MooseSpec-Queries-Tests' with: [ spec requires: #('MooseSpec-Queries' 'MooseSpec-Core-Tests') ];
				package: 'MooseSpec-Presentation' with: [ spec requires: #('MooseSpec-Queries') ].

			"Groups"
			spec
				group: 'Core' with: #('MooseSpec-Core' 'MooseSpec-Queries' 'MooseSpec-Presentation');
				group: 'Tests' with: #('MooseSpec-Core-Tests' 'MooseSpec-Queries-Tests') ]
]

{ #category : #dependencies }
BaselineOfMooseSpec >> famix: spec [
	spec
		baseline: 'Famix'
			with: [ spec
				loads: #('Core' 'Basic' 'ModelCompatibility' 'ModelJava' 'ModelSmalltalk' 'Importers');
				repository: 'github://jecisc/Famix:v3.x.x/src' ];
		project: 'FamixTests' copyFrom: 'Famix' with: [ spec loads: #('Tests') ]
]

{ #category : #dependencies }
BaselineOfMooseSpec >> spec: spec [
	spec baseline: 'Spec' with: [ spec repository: 'github://pharo-spec/Spec/src' ]
]
