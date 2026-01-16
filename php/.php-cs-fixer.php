<?php



return (new PhpCsFixer\Config())
    ->setRules([
        // don’t use @PSR12 because it overrides brace style
        '@PSR2' => true,

        // NEW rule (replaces "braces")
        'braces_position' => [
            'classes_opening_brace' => 'same_line',
            'functions_opening_brace' => 'same_line',
            'anonymous_functions_opening_brace' => 'same_line',
            'control_structures_opening_brace' => 'same_line',
        ],

        'array_syntax' => ['syntax' => 'short'],
        'single_quote' => true,
        'no_unused_imports' => true,
    ])
    // ->setIndent("\t")
    ->setLineEnding("\n")
;
