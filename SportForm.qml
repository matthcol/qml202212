import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {

    signal sportChosen(name: string)

    Sport {
        id: sport

        onNameChanged: console.log("Sport name has been set to ", sport.name)
    }


    ColumnLayout {
        ComboBox{
            id: cbChoiceSport
            model: [
                qsTr("Rugby"),
                qsTr("Football"),
                qsTr("Handball"),
                qsTr("Basket"),
                qsTr("Hockey"),
            ]
        }
        RowLayout{
            RadioButton{
                id:  rbReplace3
                // checked: true
                text: "3"
            }
            RadioButton{
                id:  rbReplace4
                text: "4"

            }
            RadioButton{
                id:  rbReplace5
                text: "5"
            }
        }
        RowLayout {
            CheckBox{
                id:  ckCompetitionCup
                text: qsTr("Coupe")
            }
            CheckBox{
                id:  ckCompetitionChampionship
                text: qsTr("Championnat")
            }

        }
        Slider {
            id: sldrPeopleCount
            from:  100
            value: 500
            to: 1000
        }
        SpinBox {
            id: spnPointCount
            from: 100
            value: 500
            to: 1000
            stepSize: 100
        }
        RowLayout {
            Tumbler {
                id: tbrHour
                model: 24

            }
            Tumbler {
                id: tbrMinutes
                model: 60

            }
            Tumbler {
                id: tbrSeconds
                model: 60

            }
        }
        Button{
            text: qsTr("Suivant")
            onClicked: {
                // retrieve all values
                console.log(cbChoiceSport.currentIndex,
                            cbChoiceSport.currentText,
                            cbChoiceSport.currentValue)
                sport.name = cbChoiceSport.currentText

                sport.countSubstitute = rbReplace3.checked ? rbReplace3.text : (
                                                                       rbReplace4.checked ? rbReplace4.text: (
                                                                       rbReplace5.checked ? rbReplace5.text: "None"))
                console.log(sport.countSubstitute)

                console.log(ckCompetitionCup.checked ? ckCompetitionCup.text : undefined)
                console.log(ckCompetitionChampionship.checked ? ckCompetitionChampionship.text : undefined)
                if (ckCompetitionCup.checked) {
                    sport.competitions.push(ckCompetitionCup.text)
                }
                if (ckCompetitionChampionship.checked) {
                    sport.competitions.push(ckCompetitionChampionship.text)
                }

                console.log(sldrPeopleCount.value)
                console.log(spnPointCount.value)
                console.log(tbrHour.currentIndex)
                console.log(tbrMinutes.currentIndex)
                console.log(tbrSeconds.currentIndex)

                console.log(sport.competitions)
                console.log(sport.text())
                // emit signal
                sportChosen(sport.name)
            }
        }
    }
}
