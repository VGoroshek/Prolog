% Copyright

implement infoPage inherits userControlSupport
    open core, vpiDomains

clauses
    new(Parent) :-
        new(),
        setContainer(Parent).

clauses
    new() :-
        userControlSupport::new(),
        generatedInitialize().

predicates
    onРедактироватьModified : editControl::modifiedListener.
clauses
    onРедактироватьModified(_Source).

predicates
    onМужскойStateChanged : radioButton::stateChangedListener.
clauses
    onМужскойStateChanged(_Source, _OldState, _NewState).

predicates
    onButtonClick : button::clickResponder.
clauses
    onButtonClick(_Source) = button::defaultAction.

predicates
    onButton1Click : button::clickResponder.
clauses
    onButton1Click(_Source) = button::defaultAction.

facts
    db : dbrel := erroneous.
    pictures : string* := [].
    n : positive := 0.
    k : positive := 0.

predicates
    onShow : window::showListener.
clauses
    onShow(_Source, _Data) :-
        some(Db) = dbrel::currentDb,
        some(Person) = Db:selectedPerson,
        !,
        db := Db,
        name_ctl:setText(Person:name),
        titul_ctl:setText(Person:titul),
        if Person:sex = "ж" then
            female_ctl:setRadioState(radioButton::checked)
        end if,
        BY = Person:birthYear,
        if BY > 0 then
            birth_ctl:setInteger(BY)
        end if,
        DY = Person:deathYear,
        if DY > 0 then
            death_ctl:setInteger(DY)
        end if,
        F = Person:fatherId,
        if F > 0 and Father in db:personList and Father:id = F then
            father_ctl:addAt(0, Father:name),
            father_ctl:selectAt(0, true)
        end if,
        M = Person:motherId,
        if M > 0 and Mother in db:personList and Mother:id = M then
            mother_ctl:addAt(0, Mother:name),
            mother_ctl:selectAt(0, true)
        end if,
        S = Person:spouseId,
        if S > 0 and Spouse in db:personList and Spouse:id = S then
            mother_ctl:addAt(0, Spouse:name),
            mother_ctl:selectAt(0, true)
        end if.

    onShow(_Source, _Data).
        % This code is maintained automatically, do not update it manually. 10:19:28-6.3.2018

facts
    name_ctl : editControl.
    titul_ctl : editControl.
    sex_ctl : groupBox.
    male_ctl : radioButton.
    female_ctl : radioButton.
    staticText3_ctl : textControl.
    birth_ctl : integercontrol.
    death_ctl : integercontrol.
    father_ctl : listButton.
    mother_ctl : listButton.
    spouse_ctl : listButton.
    pictControl_ctl : pictcontrol.
    pushButton_ctl : button.
    button_ctl : button.
    button1_ctl : button.
    button2_ctl : button.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("Информация"),
        This:setSize(400, 200),
        addShowListener(onShow),
        StaticText_ctl = textControl::new(This),
        StaticText_ctl:setText("Имя"),
        StaticText_ctl:setPosition(8, 10),
        name_ctl := editControl::new(This),
        name_ctl:setText("Редактировать"),
        name_ctl:setPosition(68, 8),
        name_ctl:setWidth(56),
        StaticText1_ctl = textControl::new(This),
        StaticText1_ctl:setText("Титул"),
        StaticText1_ctl:setPosition(8, 26),
        titul_ctl := editControl::new(This),
        titul_ctl:setText("Титул"),
        titul_ctl:setPosition(68, 24),
        titul_ctl:setWidth(56),
        titul_ctl:addModifiedListener(onРедактироватьModified),
        sex_ctl := groupBox::new(This),
        sex_ctl:setText("Пол"),
        sex_ctl:setPosition(8, 42),
        sex_ctl:setSize(140, 28),
        male_ctl := radioButton::new(sex_ctl),
        male_ctl:setText("Мужской"),
        male_ctl:setPosition(11, 0),
        male_ctl:setWidth(54),
        male_ctl:setRadioState(radioButton::checked),
        female_ctl := radioButton::new(sex_ctl),
        female_ctl:setText("Женский"),
        female_ctl:setPosition(75, 0),
        female_ctl:setWidth(54),
        female_ctl:setRadioState(radioButton::checked),
        female_ctl:addStateChangedListener(onМужскойStateChanged),
        StaticText2_ctl = textControl::new(This),
        StaticText2_ctl:setText("Год рождения"),
        StaticText2_ctl:setPosition(8, 74),
        StaticText2_ctl:setSize(124, 12),
        staticText3_ctl := textControl::new(This),
        staticText3_ctl:setText("Год смерти"),
        staticText3_ctl:setPosition(8, 92),
        staticText3_ctl:setSize(124, 12),
        birth_ctl := integercontrol::new(This),
        birth_ctl:setPosition(136, 74),
        birth_ctl:setWidth(56),
        birth_ctl:setAutoHScroll(false),
        birth_ctl:setAlignBaseline(false),
        death_ctl := integercontrol::new(This),
        death_ctl:setPosition(136, 90),
        death_ctl:setWidth(56),
        death_ctl:setAutoHScroll(false),
        death_ctl:setAlignBaseline(false),
        StaticText4_ctl = textControl::new(This),
        StaticText4_ctl:setText("Отец"),
        StaticText4_ctl:setPosition(8, 110),
        StaticText4_ctl:setSize(76, 12),
        father_ctl := listButton::new(This),
        father_ctl:setPosition(92, 110),
        father_ctl:setWidth(108),
        father_ctl:setMaxDropDownRows(4),
        StaticText5_ctl = textControl::new(This),
        StaticText5_ctl:setText("Мать"),
        StaticText5_ctl:setPosition(8, 128),
        StaticText5_ctl:setSize(76, 10),
        mother_ctl := listButton::new(This),
        mother_ctl:setPosition(92, 128),
        mother_ctl:setWidth(108),
        mother_ctl:setMaxDropDownRows(4),
        StaticText6_ctl = textControl::new(This),
        StaticText6_ctl:setText("Супруг"),
        StaticText6_ctl:setPosition(8, 146),
        StaticText6_ctl:setSize(76, 10),
        spouse_ctl := listButton::new(This),
        spouse_ctl:setPosition(92, 146),
        spouse_ctl:setWidth(108),
        spouse_ctl:setMaxDropDownRows(1),
        pictControl_ctl := pictcontrol::new(This),
        pictControl_ctl:setPosition(208, 10),
        pictControl_ctl:setSize(176, 148),
        pictControl_ctl:setAnchors([control::left, control::top, control::right, control::bottom]),
        pushButton_ctl := button::new(This),
        pushButton_ctl:setText("<<"),
        pushButton_ctl:setPosition(204, 164),
        pushButton_ctl:setWidth(40),
        pushButton_ctl:defaultHeight := true,
        button_ctl := button::new(This),
        button_ctl:setText(">>"),
        button_ctl:setPosition(252, 164),
        button_ctl:setWidth(36),
        button_ctl:defaultHeight := true,
        button_ctl:setClickResponder(onButtonClick),
        button1_ctl := button::new(This),
        button1_ctl:setText("del"),
        button1_ctl:setPosition(296, 164),
        button1_ctl:setWidth(36),
        button1_ctl:defaultHeight := true,
        button1_ctl:tooltipText := toolTip::tip("Удалить"),
        button1_ctl:setClickResponder(onButton1Click),
        button2_ctl := button::new(This),
        button2_ctl:setText("..."),
        button2_ctl:setPosition(344, 164),
        button2_ctl:setWidth(36),
        button2_ctl:defaultHeight := true,
        button2_ctl:tooltipText := toolTip::tip("Искать").
    % end of automatic code

end implement infoPage
