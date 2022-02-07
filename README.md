vim-dx
======
Delete function-call-like things with `dx`

This plugin adds a small shortcut `dx` to normal mode which deletes up to
and including the next (, [, or <, and also the matching >, ], or )
respectively.

For example, with the cursor at the caret position, `dx` will do the following:

<pre>
    Test:
        hippo = smoosh(every(a, b, c), d);
                ^------                 -
    Result:
        hippo = every(a, b, c), d;
</pre>

<pre>
    Test:
        hippo = smoosh(every(a, b, c), d);
                       ^-----       -
    Result:
        hippo = smoosh(a, b, c, d);
</pre>
