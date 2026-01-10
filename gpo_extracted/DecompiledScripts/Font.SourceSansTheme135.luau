local v0 = {
    ["fonts/Caption"] = {
        Font = Font.fromEnum(Enum.Font.SourceSans), 
        Size = 16, 
        LineHeight = 16, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body"] = {
        Font = Font.fromEnum(Enum.Font.SourceSans), 
        Size = 18, 
        LineHeight = 20, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body_Strong"] = {
        Font = Font.fromEnum(Enum.Font.SourceSansSemibold), 
        Size = 18, 
        LineHeight = 20, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Body_Large"] = {
        Font = Font.fromEnum(Enum.Font.SourceSans), 
        Size = 22, 
        LineHeight = 24, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Subtitle"] = {
        Font = Font.fromEnum(Enum.Font.SourceSansSemibold), 
        Size = 24, 
        LineHeight = 28, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Title"] = {
        Font = Font.fromEnum(Enum.Font.SourceSansSemibold), 
        Size = 32, 
        LineHeight = 36, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Title_Large"] = {
        Font = Font.fromEnum(Enum.Font.SourceSansSemibold), 
        Size = 44, 
        LineHeight = 52, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Display"] = {
        Font = Font.fromEnum(Enum.Font.SourceSansSemibold), 
        Size = 72, 
        LineHeight = 92, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Icon/Small"] = {
        Font = nil, 
        Size = 16, 
        LineHeight = 12, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }, 
    ["fonts/Icon/Standard"] = {
        Font = nil, 
        Size = 20, 
        LineHeight = 16, 
        ParagraphSpacing = 0, 
        LetterSpacing = 0
    }
};
for _, v2 in pairs(v0) do
    v2.LineHeight = v2.LineHeight / v2.Size;
end;
return v0;