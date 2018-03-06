% Copyright

implement tabForm inherits formWindow
    open core, vpiDomains

clauses
    display(Parent) = Form :-
        Form = new(Parent),
        Form:show().

clauses
    new(Parent) :-
        formWindow::new(Parent),
        generatedInitialize(),
        Page1 = tabPage::new(),
        Tab1 = infoPage::new(Page1:getContainerControl()),
        Page1:setText(Tab1:getText()),
        tabControl_ctl:addPage(Page1),
        if some(Db) = dbrel::currentDb and some(_) = Db:selectedPerson then
            Page2 = tabPage::new(),
            Tab2 = treePage::new(Page2:getContainerControl()),
            Page2:setText(Tab2:getText()),
            tabControl_ctl:addPage(Page2)
        end if,
        Page3 = tabPage::new(),
        Tab3 = bioPage::new(Page3:getContainerControl()),
        Page3:setText(Tab3:getText()),
        tabControl_ctl:addPage(Page3).

% This code is maintained automatically, do not update it manually. 09:05:10-6.3.2018
facts
    ok_ctl : button.
    cancel_ctl : button.
    help_ctl : button.
    tabControl_ctl : tabcontrol.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("tabForm"),
        setRect(rct(50, 40, 498, 336)),
        setDecoration(titlebar([closeButton, maximizeButton, minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings, wsf_ClipChildren]),
        menuSet(noMenu),
        ok_ctl := button::newOk(This),
        ok_ctl:setText("&OK"),
        ok_ctl:setPosition(164, 276),
        ok_ctl:setSize(56, 16),
        ok_ctl:defaultHeight := false,
        ok_ctl:setAnchors([control::right, control::bottom]),
        cancel_ctl := button::newCancel(This),
        cancel_ctl:setText("Cancel"),
        cancel_ctl:setPosition(228, 276),
        cancel_ctl:setSize(56, 16),
        cancel_ctl:defaultHeight := false,
        cancel_ctl:setAnchors([control::right, control::bottom]),
        help_ctl := button::new(This),
        help_ctl:setText("&Help"),
        help_ctl:setPosition(292, 276),
        help_ctl:setSize(56, 16),
        help_ctl:defaultHeight := false,
        help_ctl:setAnchors([control::right, control::bottom]),
        tabControl_ctl := tabcontrol::new(This),
        tabControl_ctl:setPosition(12, 4),
        tabControl_ctl:setSize(400, 250),
        tabControl_ctl:setAnchors([control::left, control::top, control::right, control::bottom]).
    % end of automatic code

end implement tabForm
