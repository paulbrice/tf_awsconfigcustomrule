import boto3
import botocore
import json

APPLICABLE_RESOURCES = ""


def is_applicable(config_item, event):
    status = config_item['configurationItemStatus']
    event_left_scope = event['eventLeftScope']
    return ((status in ['OK', 'ResourceDiscovered'])
            and (event_left_scope == False)
            and (config_item['resourceType'] == APPLICABLE_RESOURCES))


def evaluate_compliance(configuration_item):

        annotation_message = "APPLICABLE"
        compliance_state = True

    if compliance_state:
        return {
            "compliance_value": "COMPLIANT",
            "annotation": annotation_message
        }
    else:
        return {
            "compliance_value": "NON_COMPLIANT",
            "annotation": annotation_message
        }


def lambda_handler(event, context):

    # print('Event {}'.format(event))

    invoking_event = json.loads(event['invokingEvent'])
    configuration_item = invoking_event["configurationItem"]
    compliance_value = 'NOT_APPLICABLE'
    annotation = "NOT_APPLICABLE"

    if is_applicable(configuration_item, event):
        evaluation = evaluate_compliance(configuration_item)
        compliance_value = evaluation["compliance_value"]
        annotation = evaluation["annotation"]
        # print(compliance_value)
        # print(annotation)

    config = boto3.client('config')

    response = config.put_evaluations(
        Evaluations=[
            {
                'ComplianceResourceType':
                configuration_item['resourceType'],
                'ComplianceResourceId':
                configuration_item['resourceId'],
                'ComplianceType':
                compliance_value,
                "Annotation":
                annotation,
                'OrderingTimestamp':
                configuration_item['configurationItemCaptureTime']
            },
        ],
        ResultToken=event['resultToken'])
