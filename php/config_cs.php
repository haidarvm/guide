<?php

$finder = (new PhpCsFixer\Finder())
    ->in(__DIR__)
;

return (new PhpCsFixer\Config())
    ->setRules([
        '@PER-CS' => true,
        '@PHP8x2Migration' => true,
        'curly_braces_position' => [
			'control_structures_opening_brace' => 'same_line',
			'functions_opening_brace' => 'same_line',
			'classes_opening_brace' => 'same_line',
			'anonymous_functions_opening_brace' => 'same_line',
			'anonymous_classes_opening_brace' => 'same_line',
		],
    ])
    ->setFinder($finder)
;
