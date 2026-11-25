import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _thumbnail = '';
  String _screenshot = '';
  String _role = '';
  String _year = '';
  String _stack = '';
  String _problem = '';
  String _goals = '';

  bool _isSubmitting = false;

  // Memvalidasi URL yang bersifat opsional.
  String? _validateOptionalUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(value.trim());

    if (uri == null ||
        !uri.hasScheme ||
        (uri.scheme != 'http' && uri.scheme != 'https') ||
        uri.host.isEmpty) {
      return 'Please enter a valid URL!';
    }

    return null;
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final loggedIn = await ensureLoggedIn(context);

      if (!mounted || !loggedIn) return;

      final token = context.read<AuthState>().token;

      if (token == null) return;

      final newProject = Project(
        title: _title.trim(),
        description: _description.trim(),
        thumbnail: _thumbnail.trim(),
        screenshot: _screenshot.trim(),
        role: _role.trim(),
        year: int.parse(_year.trim()),
        stack: _stack.trim(),
        problem: _problem.trim(),
        goals: _goals.trim(),
      );

      await context.read<ApiClient>().createProject(
        newProject,
        token: token,
      );

      if (!mounted) return;

      await showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Project successfully added!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Title: $_title'),
                  Text('Description: $_description'),
                  Text('Thumbnail: ${_thumbnail.isEmpty ? '-' : _thumbnail}'),
                  Text('Screenshot: ${_screenshot.isEmpty ? '-' : _screenshot}'),
                  Text('Role: $_role'),
                  Text('Year: $_year'),
                  Text('Stack: $_stack'),
                  Text('Problem: $_problem'),
                  Text('Goals: $_goals'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      if (!mounted) return;

      _formKey.currentState!.reset();

      setState(() {
        _title = '';
        _description = '';
        _thumbnail = '';
        _screenshot = '';
        _role = '';
        _year = '';
        _stack = '';
        _problem = '';
        _goals = '';
      });
    } on ApiException catch (e) {
      if (!mounted) return;

      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Your session has expired. Please log in again.',
            ),
          ),
        );

        // Meminta pengguna login kembali.
        await ensureLoggedIn(context);

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to create project. '
            'Status code: ${e.statusCode}',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Project Form'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Title ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Project Title',
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _title = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Title cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Describe your project',
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _description = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Description cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/thumbnail.png',
                    labelText: 'Thumbnail URL (Optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _thumbnail = value,
                  validator: _validateOptionalUrl,
                ),
              ),

              // === Screenshot URL ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/screenshot.png',
                    labelText: 'Screenshot URL (Optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _screenshot = value,
                  validator: _validateOptionalUrl,
                ),
              ),

              // === Role ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Example: Full-stack Developer',
                    labelText: 'Role',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _role = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Role cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Year ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Example: 2026',
                    labelText: 'Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _year = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Year cannot be empty!';
                    }

                    final year = int.tryParse(value.trim());

                    if (year == null || year <= 0) {
                      return 'Please enter a valid year!';
                    }

                    return null;
                  },
                ),
              ),

              // === Stack ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Example: Flutter, Django, PostgreSQL',
                    labelText: 'Stack',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _stack = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Stack cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Problem ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Describe the problem your project addresses',
                    labelText: 'Problem',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _problem = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Problem cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Goals ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Describe the goals of your project',
                    labelText: 'Goals',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _goals = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Goals cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Submit Button ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}