% Copyright

implement familyForm inherits formWindow
    open core, vpiDomains

clauses
    display(Parent) = Form :-
        Form = new(Parent),
        Form:show().

clauses
    new(Parent) :-
        formWindow::new(Parent),
        generatedInitialize().

predicates
    onShow : window::showListener.

facts
    db : dbrel := erroneous.

clauses
    onShow(_Source, _Data) :-
        some(Db) = dbrel::currentDb,
        !,
        db := Db,
        listbox_ctl:setTabStops([8]),
        List = [ string::format("%2.\t%", Person:id, Person:name) || Person in db:personList ],
        listbox_ctl:addList(List).

    onShow(_Source, _Data).

predicates
    onListboxSelectionChanged : listControl::selectionChangedListener.
clauses
    onListboxSelectionChanged(_Source) :-
        Index = listbox_ctl:tryGetSelectedIndex(),
        Item = listbox_ctl:getAt(Index),
        string::frontToken(Item, Tok, _),
        Id = tryToTerm(unsigned, Tok),
        Person in db:personList,
        Person:id = Id,
        Person:pictures = [Filename | _],
        !,
        pictControl_ctl:drawPicture(Filename).

    onListboxSelectionChanged(_Source) :-
        pictControl_ctl:clear().

predicates
    onViewClick : button::clickResponder.
clauses
    onViewClick(_Source) = button::defaultAction :-
        Index = listbox_ctl:tryGetSelectedIndex(),
        Item = listbox_ctl:getAt(Index),
        string::frontToken(Item, Tok, _),
        Id = tryToTerm(Tok),
        Person in db:personList,
        Person:id = Id,
        !,
        dbrel::currentDb := some(db),
        db:selectedPerson := some(Person),
        Form = tabForm::display(applicationWindow::get()),
        Form:setText(Person:name).

    onViewClick(_Source) = button::defaultAction.

predicates
    onDelClick : button::clickResponder.
clauses
    onDelClick(_Source) = button::defaultAction.

% This code is maintained automatically, do not update it manually. 11:53:01-27.2.2018
facts
    ok_ctl : button.
    cancel_ctl : button.
    save_ctl : button.
    listbox_ctl : listBox.
    pictControl_ctl : pictcontrol.
    view_ctl : button.
    add_ctl : button.
    del_ctl : button.
    edit_ctl : button.
    table_ctl : button.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("familyForm"),
        setRect(rct(50, 40, 492, 314)),
        setDecoration(titlebar([closeButton, maximizeButton, minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings, wsf_ClipChildren]),
        menuSet(noMenu),
        addShowListener(onShow),
        ok_ctl := button::newOk(This),
        ok_ctl:setText("&OK"),
        ok_ctl:setPosition(20, 228),
        ok_ctl:setSize(56, 16),
        ok_ctl:defaultHeight := false,
        ok_ctl:setAnchors([control::right, control::bottom]),
        cancel_ctl := button::newCancel(This),
        cancel_ctl:setText("Cancel"),
        cancel_ctl:setPosition(212, 228),
        cancel_ctl:setSize(56, 16),
        cancel_ctl:defaultHeight := false,
        cancel_ctl:setAnchors([control::right, control::bottom]),
        save_ctl := button::new(This),
        save_ctl:setText("Сохранить"),
        save_ctl:setPosition(148, 228),
        save_ctl:setWidth(56),
        save_ctl:defaultHeight := true,
        save_ctl:setAnchors([control::right, control::bottom]),
        listbox_ctl := listBox::new(This),
        listbox_ctl:setPosition(20, 10),
        listbox_ctl:setSize(132, 128),
        listbox_ctl:setUseTabStops(),
        listbox_ctl:addSelectionChangedListener(onListboxSelectionChanged),
        pictControl_ctl := pictcontrol::new(This),
        pictControl_ctl:setPosition(168, 10),
        pictControl_ctl:setSize(192, 180),
        pictControl_ctl:setAnchors([control::left, control::top, control::right, control::bottom]),
        view_ctl := button::new(This),
        view_ctl:setText("Просмотр сведений"),
        view_ctl:setPosition(20, 200),
        view_ctl:setWidth(76),
        view_ctl:defaultHeight := true,
        view_ctl:setAnchors([control::right, control::bottom]),
        view_ctl:setClickResponder(onViewClick),
        add_ctl := button::new(This),
        add_ctl:setText("Добавить человека"),
        add_ctl:setPosition(108, 200),
        add_ctl:setWidth(76),
        add_ctl:defaultHeight := true,
        add_ctl:setAnchors([control::right, control::bottom]),
        del_ctl := button::new(This),
        del_ctl:setText("Удалить человека"),
        del_ctl:setPosition(196, 200),
        del_ctl:setWidth(76),
        del_ctl:defaultHeight := true,
        del_ctl:setAnchors([control::right, control::bottom]),
        del_ctl:setClickResponder(onDelClick),
        edit_ctl := button::new(This),
        edit_ctl:setText("Редактировать"),
        edit_ctl:setPosition(284, 200),
        edit_ctl:setWidth(76),
        edit_ctl:defaultHeight := true,
        edit_ctl:setAnchors([control::right, control::bottom]),
        table_ctl := button::new(This),
        table_ctl:setText("Таблица"),
        table_ctl:setPosition(84, 228),
        table_ctl:setWidth(56),
        table_ctl:defaultHeight := true,
        table_ctl:setAnchors([control::right, control::bottom]).
    % end of automatic code

end implement familyForm
