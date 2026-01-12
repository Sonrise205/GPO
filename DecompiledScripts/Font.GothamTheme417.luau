local v0 = {
    ["fonts/Caption"] = {
        Font = Font.fromEnum(Enum.Font.Gotham), 
        Size = 12, 
        LineHeight = 16, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body"] = {
        Font = Font.fromEnum(Enum.Font.Gotham), 
        Size = 14, 
        LineHeight = 20, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body_Strong"] = {
        Font = Font.fromEnum(Enum.Font.GothamMedium), 
        Size = 14, 
        LineHeight = 20, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body_Large"] = {
        Font = Font.fromEnum(Enum.Font.Gotham), 
        Size = 18, 
        LineHeight = 24, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Subtitle"] = {
        Font = Font.fromEnum(Enum.Font.GothamMedium), 
        Size = 20, 
        LineHeight = 28, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Title"] = {
        Font = Font.fromEnum(Enum.Font.GothamMedium), 
        Size = 28, 
        LineHeight = 36, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Title_Large"] = {
        Font = Font.fromEnum(Enum.Font.GothamMedium), 
        Size = 40, 
        LineHeight = 52, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Display"] = {
        Font = Font.fromEnum(Enum.Font.GothamMedium), 
        Size = 68, 
        LineHeight = 92, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Icon/Small"] = {
        Font = nil, 
        Size = 12, 
        LineHeight = 12, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Icon/Standard"] = {
        Font = nil, 
        Size = 16, 
        LineHeight = 16, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }
};
for _, v2 in pairs(v0) do
    v2.LineHeight = v2.LineHeight / v2.Size;
end;
return v0;