% Copyright

implement pictControl inherits userControlSupport
    open core, vpiDomains

clauses
    new(Parent) :-
        new(),
        setContainer(Parent).

clauses
    new() :-
        userControlSupport::new(),
        generatedInitialize().

facts
    pict : picture := erroneous.
    pictRect : rct := rct(0, 0, 100, 100).

clauses
    drawPicture(Filename) :-
        try
            Pict = vpi::pictLoad(Filename)
        catch Error do
            stdio::write("Ошибка %. Невозможно загрузить картинку из %\n", Error, Filename),
            fail
        end try,
        !,
        pict := Pict,
        vpi::pictGetSize(pict, W, H, _),
        pictRect := rct(0, 0, W, H),
        invalidate().

    drawPicture(_) :-
        clear().

    clear() :-
        pict := erroneous,
        invalidate().

predicates
    onSize : window::sizeListener.
clauses
    onSize(_Source) :-
        invalidate().

predicates
    onEraseBackground : window::eraseBackgroundResponder.
clauses
    onEraseBackground(_Source, _GDI) = noEraseBackground.

predicates
    onPaint : window::paintResponder.
clauses
    onPaint(_Source, Rectangle, GDI) :-
        not(isErroneous(pict)),
        !,
        GDI:pictDraw(pict, Rectangle, pictRect, rop_SrcCopy).

    onPaint(_Source, Rectangle, GDI) :-
        GDI:clear(color_GoldenRod),
        GDI:drawTextInRect(Rectangle, "БЕЗ ФОТО", [dtext_center, dtext_vcenter, dtext_singleline]).

% This code is maintained automatically, do not update it manually. 10:24:58-27.2.2018

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("pictControl"),
        This:setSize(240, 120),
        addSizeListener(onSize),
        setEraseBackgroundResponder(onEraseBackground),
        setPaintResponder(onPaint).
    % end of automatic code

end implement pictControl
