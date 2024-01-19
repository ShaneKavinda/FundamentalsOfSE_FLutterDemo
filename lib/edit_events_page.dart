// TODO Implement this library.
import 'package:flutter/material.dart';

class Event {
  String eventName;
  DateTime eventDate;
  List<String>
      groups; // Add this line to store groups associated with the event

  Event(this.eventName, this.eventDate, {List<String> groups = const []})
      : groups = groups;

  // Add any additional properties or methods as needed
}

class Swimmer {
  String name;
  int age;
  String? group;

  Swimmer(this.name, this.age, this.group);

  // Add any additional properties or methods as needed
}

class SwimmerWithGroup {
  Swimmer swimmer;
  String group;

  SwimmerWithGroup(this.swimmer, this.group);
}

class EditEventsPage extends StatefulWidget {
  @override
  _EditEventsPageState createState() => _EditEventsPageState();
}

class _EditEventsPageState extends State<EditEventsPage> {
  // Replace this with your actual data or logic to fetch and edit events
  List<Event> events = [
    Event('Event 1', DateTime(2022, 12, 15)),
    Event('Event 2', DateTime(2022, 12, 20)),
    // Add more events as needed
  ];

  // Replace this with your actual data or logic to fetch swimmers
  List<Swimmer> swimmers = [
    Swimmer('Swimmer 1', 20, null),
    Swimmer('Swimmer 2', 22, 'Group 7'),
    // Add more swimmers as needed
  ];

  // Add groups to the event
  List<String> eventGroups = ['Group A', 'Group B', 'Group C'];

  // Selected event and swimmers for editing
  Event? selectedEvent;
  List<SwimmerWithGroup> selectedSwimmers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Events'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildEventList(),
          ),
          Expanded(
            flex: 3,
            child: _buildEditEventForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.0,
        ),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(events[index].eventName),
              subtitle: Text(
                'Date: ${events[index].eventDate.day}/${events[index].eventDate.month}/${events[index].eventDate.year}',
              ),
              onTap: () {
                setState(() {
                  selectedEvent = events[index];
                  // Clear selected swimmers when a new event is selected
                  selectedSwimmers.clear();
                });
              },
              selected: selectedEvent == events[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditEventForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Event',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          if (selectedEvent != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Event Name: ${selectedEvent!.eventName}'),
                Text(
                  'Event Date: ${selectedEvent!.eventDate.day}/${selectedEvent!.eventDate.month}/${selectedEvent!.eventDate.year}',
                ),
                SizedBox(height: 20.0),
                _buildEventFormFields(),
                SizedBox(height: 20.0),
                _buildAddGroups(),
              ],
            ),
          SizedBox(height: 20.0),
          Text(
            'Swimmers List',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: _buildSwimmersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEventFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: selectedEvent?.eventName,
          decoration: InputDecoration(labelText: 'Event Name'),
        ),
        TextFormField(
          initialValue: selectedEvent != null
              ? '${selectedEvent!.eventDate.day}/${selectedEvent!.eventDate.month}/${selectedEvent!.eventDate.year}'
              : '',
          decoration: InputDecoration(labelText: 'Event Date'),
        ),
        // Add more form fields as needed
      ],
    );
  }

  Widget _buildAddGroups() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Groups to Event',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Wrap(
          spacing: 8.0,
          children: eventGroups.map((group) {
            return FilterChip(
              label: Text(group),
              selected: selectedEvent?.groups.contains(group) ?? false,
              onSelected: (selected) {
                setState(() {
                  if (selectedEvent != null) {
                    if (selected) {
                      selectedEvent!.groups.add(group);
                    } else {
                      selectedEvent!.groups.remove(group);
                    }
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSwimmersList() {
    return ListView.builder(
      itemCount: swimmers.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title:
                Text('${swimmers[index].name} - Age: ${swimmers[index].age}'),
            trailing: DropdownButton<String>(
              hint: Text('Select Group'),
              value: selectedSwimmers.length > index
                  ? selectedSwimmers[index].group
                  : null,
              onChanged: (newValue) {
                setState(() {
                  if (selectedSwimmers.length > index) {
                    selectedSwimmers[index].group = newValue!;
                  } else {
                    selectedSwimmers.add(
                      SwimmerWithGroup(swimmers[index], newValue!),
                    );
                  }
                });
              },
              items: eventGroups.map((group) {
                return DropdownMenuItem<String>(
                  value: group,
                  child: Text(group),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
