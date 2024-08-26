    import 'package:flutter/material.dart';

    class _FormImplementation extends StatefulWidget {
        const _FormImplementation({Key key}) : super(key: key);

        @override
        __FormImplementationState createState() => __FormImplementationState();
    }

    class __FormImplementationState extends State<_FormImplementation> {
        final _formKey = GlobalKey<FormState>();

        TextEditingController _emailFieldController;
        TextEditingController _passwordFieldController;

        @override
        void initState() {
            super.initState();

            _emailFieldController = TextEditingController();
            _passwordFieldController = TextEditingController();
        }

        @override
        void dispose() {
            _emailFieldController.dispose();
            _passwordFieldController.dispose();

            super.dispose();
        }

        void _onSubmit() {
            if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'email: ${this._emailFieldController.text} && password: ${this._passwordFieldController.text}',
                        ),
                    ),
                );
            }
        }

        @override
        Widget build(BuildContext context) {
            return Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        TextFormField(
                            controller: _emailFieldController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                        Icons.email,
                                ),
                                hintText: 'Email',
                            ),
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter user id';
                                }
                                return null;
                            },
                        ),
                        TextFormField(
                            controller: _passwordFieldController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                    Icons.password,
                                ),
                                hintText: 'Password',
                            ),
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter user id';
                                }
                                return null;
                            },
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                                onPressed: _onSubmit,
                                child: const Text('Submit'),
                            ),
                        ),
                    ],
                ),
            );
        }
    }
