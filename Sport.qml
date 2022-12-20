import QtQuick

Item {
    id: sport
    property string name: ""
    property string countSubstitute: ""
    property var competitions: []
    property int countPeople: 0
    property int countPoint: 0
    // property date creation: undefined

    function text(): string {
        return `${sport.name} ; ${sport.countSubstitute} ; ${sport.competitions} ; ${sport.countPeople} ; ${countPoint}`
    }
}
